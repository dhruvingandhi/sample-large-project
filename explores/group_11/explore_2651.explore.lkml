# Explore: explore_2651
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07954.view.lkml"
include: "/views/domain_06/view_07956.view.lkml"
include: "/views/domain_07/view_07957.view.lkml"
include: "/views/domain_08/view_07958.view.lkml"

explore: explore_2651 {
  label: "Explore Explore 2651"
  description: "Comprehensive analytics explore joining base view_07954 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07954
  
  always_filter: {
    filters: [view_07954.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07954.created_at_date: "7 days"]
    unless: [view_07954.id, view_07954.status]
  }

  join: view_07956 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07954.user_id} = ${view_07956.id} ;;
    required_joins: []
  }

  join: view_07957 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07954.account_id} = ${view_07957.account_id} ;;
    required_joins: [view_07956]
  }

  join: view_07958 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07954.category} = ${view_07958.category} ;;
  }

  access_filter: {
    field: view_07954.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07954.is_deleted} = false ;;
}
