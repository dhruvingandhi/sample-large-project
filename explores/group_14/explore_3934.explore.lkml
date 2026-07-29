# Explore: explore_3934
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11803.view.lkml"
include: "/views/domain_05/view_11805.view.lkml"
include: "/views/domain_06/view_11806.view.lkml"
include: "/views/domain_07/view_11807.view.lkml"

explore: explore_3934 {
  label: "Explore Explore 3934"
  description: "Comprehensive analytics explore joining base view_11803 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11803
  
  always_filter: {
    filters: [view_11803.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11803.created_at_date: "7 days"]
    unless: [view_11803.id, view_11803.status]
  }

  join: view_11805 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11803.user_id} = ${view_11805.id} ;;
    required_joins: []
  }

  join: view_11806 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11803.account_id} = ${view_11806.account_id} ;;
    required_joins: [view_11805]
  }

  join: view_11807 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11803.category} = ${view_11807.category} ;;
  }

  access_filter: {
    field: view_11803.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11803.is_deleted} = false ;;
}
