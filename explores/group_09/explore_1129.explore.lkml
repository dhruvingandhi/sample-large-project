# Explore: explore_1129
# Auto-generated LookML Explore File

include: "/views/domain_38/view_03388.view.lkml"
include: "/views/domain_40/view_03390.view.lkml"
include: "/views/domain_41/view_03391.view.lkml"
include: "/views/domain_42/view_03392.view.lkml"

explore: explore_1129 {
  label: "Explore Explore 1129"
  description: "Comprehensive analytics explore joining base view_03388 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03388
  
  always_filter: {
    filters: [view_03388.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03388.created_at_date: "7 days"]
    unless: [view_03388.id, view_03388.status]
  }

  join: view_03390 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03388.user_id} = ${view_03390.id} ;;
    required_joins: []
  }

  join: view_03391 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03388.account_id} = ${view_03391.account_id} ;;
    required_joins: [view_03390]
  }

  join: view_03392 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03388.category} = ${view_03392.category} ;;
  }

  access_filter: {
    field: view_03388.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03388.is_deleted} = false ;;
}
