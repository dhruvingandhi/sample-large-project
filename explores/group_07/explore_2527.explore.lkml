# Explore: explore_2527
# Auto-generated LookML Explore File

include: "/views/domain_32/view_07582.view.lkml"
include: "/views/domain_34/view_07584.view.lkml"
include: "/views/domain_35/view_07585.view.lkml"
include: "/views/domain_36/view_07586.view.lkml"

explore: explore_2527 {
  label: "Explore Explore 2527"
  description: "Comprehensive analytics explore joining base view_07582 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07582
  
  always_filter: {
    filters: [view_07582.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07582.created_at_date: "7 days"]
    unless: [view_07582.id, view_07582.status]
  }

  join: view_07584 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07582.user_id} = ${view_07584.id} ;;
    required_joins: []
  }

  join: view_07585 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07582.account_id} = ${view_07585.account_id} ;;
    required_joins: [view_07584]
  }

  join: view_07586 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07582.category} = ${view_07586.category} ;;
  }

  access_filter: {
    field: view_07582.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07582.is_deleted} = false ;;
}
