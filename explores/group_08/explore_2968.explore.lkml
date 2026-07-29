# Explore: explore_2968
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08905.view.lkml"
include: "/views/domain_07/view_08907.view.lkml"
include: "/views/domain_08/view_08908.view.lkml"
include: "/views/domain_09/view_08909.view.lkml"

explore: explore_2968 {
  label: "Explore Explore 2968"
  description: "Comprehensive analytics explore joining base view_08905 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08905
  
  always_filter: {
    filters: [view_08905.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08905.created_at_date: "7 days"]
    unless: [view_08905.id, view_08905.status]
  }

  join: view_08907 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08905.user_id} = ${view_08907.id} ;;
    required_joins: []
  }

  join: view_08908 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08905.account_id} = ${view_08908.account_id} ;;
    required_joins: [view_08907]
  }

  join: view_08909 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08905.category} = ${view_08909.category} ;;
  }

  access_filter: {
    field: view_08905.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08905.is_deleted} = false ;;
}
