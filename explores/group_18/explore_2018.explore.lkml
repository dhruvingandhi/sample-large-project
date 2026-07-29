# Explore: explore_2018
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06055.view.lkml"
include: "/views/domain_07/view_06057.view.lkml"
include: "/views/domain_08/view_06058.view.lkml"
include: "/views/domain_09/view_06059.view.lkml"

explore: explore_2018 {
  label: "Explore Explore 2018"
  description: "Comprehensive analytics explore joining base view_06055 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06055
  
  always_filter: {
    filters: [view_06055.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06055.created_at_date: "7 days"]
    unless: [view_06055.id, view_06055.status]
  }

  join: view_06057 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06055.user_id} = ${view_06057.id} ;;
    required_joins: []
  }

  join: view_06058 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06055.account_id} = ${view_06058.account_id} ;;
    required_joins: [view_06057]
  }

  join: view_06059 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06055.category} = ${view_06059.category} ;;
  }

  access_filter: {
    field: view_06055.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06055.is_deleted} = false ;;
}
