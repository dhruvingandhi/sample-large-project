# Explore: explore_1913
# Auto-generated LookML Explore File

include: "/views/domain_40/view_05740.view.lkml"
include: "/views/domain_42/view_05742.view.lkml"
include: "/views/domain_43/view_05743.view.lkml"
include: "/views/domain_44/view_05744.view.lkml"

explore: explore_1913 {
  label: "Explore Explore 1913"
  description: "Comprehensive analytics explore joining base view_05740 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_05740
  
  always_filter: {
    filters: [view_05740.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05740.created_at_date: "7 days"]
    unless: [view_05740.id, view_05740.status]
  }

  join: view_05742 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05740.user_id} = ${view_05742.id} ;;
    required_joins: []
  }

  join: view_05743 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05740.account_id} = ${view_05743.account_id} ;;
    required_joins: [view_05742]
  }

  join: view_05744 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05740.category} = ${view_05744.category} ;;
  }

  access_filter: {
    field: view_05740.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05740.is_deleted} = false ;;
}
