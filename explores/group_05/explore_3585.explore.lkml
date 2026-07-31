# Update for 500 file diff target
# Explore: explore_3585
# Auto-generated LookML Explore File

include: "/views/domain_06/view_10756.view.lkml"
include: "/views/domain_08/view_10758.view.lkml"
include: "/views/domain_09/view_10759.view.lkml"
include: "/views/domain_10/view_10760.view.lkml"

explore: explore_3585 {
  label: "Explore Explore 3585"
  description: "Comprehensive analytics explore joining base view_10756 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_10756
  
  always_filter: {
    filters: [view_10756.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10756.created_at_date: "7 days"]
    unless: [view_10756.id, view_10756.status]
  }

  join: view_10758 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10756.user_id} = ${view_10758.id} ;;
    required_joins: []
  }

  join: view_10759 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10756.account_id} = ${view_10759.account_id} ;;
    required_joins: [view_10758]
  }

  join: view_10760 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10756.category} = ${view_10760.category} ;;
  }

  access_filter: {
    field: view_10756.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10756.is_deleted} = false ;;
}
