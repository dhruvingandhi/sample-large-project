# Explore: explore_1032
# Auto-generated LookML Explore File

include: "/views/domain_47/view_03097.view.lkml"
include: "/views/domain_49/view_03099.view.lkml"
include: "/views/domain_50/view_03100.view.lkml"
include: "/views/domain_01/view_03101.view.lkml"

explore: explore_1032 {
  label: "Explore Explore 1032"
  description: "Comprehensive analytics explore joining base view_03097 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03097
  
  always_filter: {
    filters: [view_03097.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03097.created_at_date: "7 days"]
    unless: [view_03097.id, view_03097.status]
  }

  join: view_03099 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03097.user_id} = ${view_03099.id} ;;
    required_joins: []
  }

  join: view_03100 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03097.account_id} = ${view_03100.account_id} ;;
    required_joins: [view_03099]
  }

  join: view_03101 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03097.category} = ${view_03101.category} ;;
  }

  access_filter: {
    field: view_03097.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03097.is_deleted} = false ;;
}
