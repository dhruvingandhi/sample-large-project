# Explore: explore_2131
# Auto-generated LookML Explore File

include: "/views/domain_44/view_06394.view.lkml"
include: "/views/domain_46/view_06396.view.lkml"
include: "/views/domain_47/view_06397.view.lkml"
include: "/views/domain_48/view_06398.view.lkml"

explore: explore_2131 {
  label: "Explore Explore 2131"
  description: "Comprehensive analytics explore joining base view_06394 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06394
  
  always_filter: {
    filters: [view_06394.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06394.created_at_date: "7 days"]
    unless: [view_06394.id, view_06394.status]
  }

  join: view_06396 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06394.user_id} = ${view_06396.id} ;;
    required_joins: []
  }

  join: view_06397 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06394.account_id} = ${view_06397.account_id} ;;
    required_joins: [view_06396]
  }

  join: view_06398 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06394.category} = ${view_06398.category} ;;
  }

  access_filter: {
    field: view_06394.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06394.is_deleted} = false ;;
}
