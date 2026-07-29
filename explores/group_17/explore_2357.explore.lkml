# Explore: explore_2357
# Auto-generated LookML Explore File

include: "/views/domain_22/view_07072.view.lkml"
include: "/views/domain_24/view_07074.view.lkml"
include: "/views/domain_25/view_07075.view.lkml"
include: "/views/domain_26/view_07076.view.lkml"

explore: explore_2357 {
  label: "Explore Explore 2357"
  description: "Comprehensive analytics explore joining base view_07072 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07072
  
  always_filter: {
    filters: [view_07072.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07072.created_at_date: "7 days"]
    unless: [view_07072.id, view_07072.status]
  }

  join: view_07074 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07072.user_id} = ${view_07074.id} ;;
    required_joins: []
  }

  join: view_07075 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07072.account_id} = ${view_07075.account_id} ;;
    required_joins: [view_07074]
  }

  join: view_07076 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07072.category} = ${view_07076.category} ;;
  }

  access_filter: {
    field: view_07072.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07072.is_deleted} = false ;;
}
