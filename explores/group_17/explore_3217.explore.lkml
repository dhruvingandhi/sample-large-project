# Explore: explore_3217
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09652.view.lkml"
include: "/views/domain_04/view_09654.view.lkml"
include: "/views/domain_05/view_09655.view.lkml"
include: "/views/domain_06/view_09656.view.lkml"

explore: explore_3217 {
  label: "Explore Explore 3217"
  description: "Comprehensive analytics explore joining base view_09652 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09652
  
  always_filter: {
    filters: [view_09652.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09652.created_at_date: "7 days"]
    unless: [view_09652.id, view_09652.status]
  }

  join: view_09654 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09652.user_id} = ${view_09654.id} ;;
    required_joins: []
  }

  join: view_09655 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09652.account_id} = ${view_09655.account_id} ;;
    required_joins: [view_09654]
  }

  join: view_09656 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09652.category} = ${view_09656.category} ;;
  }

  access_filter: {
    field: view_09652.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09652.is_deleted} = false ;;
}
