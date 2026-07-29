# Explore: explore_2579
# Auto-generated LookML Explore File

include: "/views/domain_38/view_07738.view.lkml"
include: "/views/domain_40/view_07740.view.lkml"
include: "/views/domain_41/view_07741.view.lkml"
include: "/views/domain_42/view_07742.view.lkml"

explore: explore_2579 {
  label: "Explore Explore 2579"
  description: "Comprehensive analytics explore joining base view_07738 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07738
  
  always_filter: {
    filters: [view_07738.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07738.created_at_date: "7 days"]
    unless: [view_07738.id, view_07738.status]
  }

  join: view_07740 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07738.user_id} = ${view_07740.id} ;;
    required_joins: []
  }

  join: view_07741 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07738.account_id} = ${view_07741.account_id} ;;
    required_joins: [view_07740]
  }

  join: view_07742 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07738.category} = ${view_07742.category} ;;
  }

  access_filter: {
    field: view_07738.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07738.is_deleted} = false ;;
}
