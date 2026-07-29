# Explore: explore_0703
# Auto-generated LookML Explore File

include: "/views/domain_10/view_02110.view.lkml"
include: "/views/domain_12/view_02112.view.lkml"
include: "/views/domain_13/view_02113.view.lkml"
include: "/views/domain_14/view_02114.view.lkml"

explore: explore_0703 {
  label: "Explore Explore 0703"
  description: "Comprehensive analytics explore joining base view_02110 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02110
  
  always_filter: {
    filters: [view_02110.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02110.created_at_date: "7 days"]
    unless: [view_02110.id, view_02110.status]
  }

  join: view_02112 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02110.user_id} = ${view_02112.id} ;;
    required_joins: []
  }

  join: view_02113 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02110.account_id} = ${view_02113.account_id} ;;
    required_joins: [view_02112]
  }

  join: view_02114 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02110.category} = ${view_02114.category} ;;
  }

  access_filter: {
    field: view_02110.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02110.is_deleted} = false ;;
}
