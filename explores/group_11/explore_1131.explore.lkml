# Update for 2000 file diff target
# Explore: explore_1131
# Auto-generated LookML Explore File

include: "/views/domain_44/view_03394.view.lkml"
include: "/views/domain_46/view_03396.view.lkml"
include: "/views/domain_47/view_03397.view.lkml"
include: "/views/domain_48/view_03398.view.lkml"

explore: explore_1131 {
  label: "Explore Explore 1131"
  description: "Comprehensive analytics explore joining base view_03394 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03394
  
  always_filter: {
    filters: [view_03394.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03394.created_at_date: "7 days"]
    unless: [view_03394.id, view_03394.status]
  }

  join: view_03396 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03394.user_id} = ${view_03396.id} ;;
    required_joins: []
  }

  join: view_03397 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03394.account_id} = ${view_03397.account_id} ;;
    required_joins: [view_03396]
  }

  join: view_03398 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03394.category} = ${view_03398.category} ;;
  }

  access_filter: {
    field: view_03394.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03394.is_deleted} = false ;;
}
