# Explore: explore_2585
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07756.view.lkml"
include: "/views/domain_08/view_07758.view.lkml"
include: "/views/domain_09/view_07759.view.lkml"
include: "/views/domain_10/view_07760.view.lkml"

explore: explore_2585 {
  label: "Explore Explore 2585"
  description: "Comprehensive analytics explore joining base view_07756 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07756
  
  always_filter: {
    filters: [view_07756.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07756.created_at_date: "7 days"]
    unless: [view_07756.id, view_07756.status]
  }

  join: view_07758 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07756.user_id} = ${view_07758.id} ;;
    required_joins: []
  }

  join: view_07759 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07756.account_id} = ${view_07759.account_id} ;;
    required_joins: [view_07758]
  }

  join: view_07760 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07756.category} = ${view_07760.category} ;;
  }

  access_filter: {
    field: view_07756.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07756.is_deleted} = false ;;
}
