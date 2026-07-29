# Explore: explore_2746
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08239.view.lkml"
include: "/views/domain_41/view_08241.view.lkml"
include: "/views/domain_42/view_08242.view.lkml"
include: "/views/domain_43/view_08243.view.lkml"

explore: explore_2746 {
  label: "Explore Explore 2746"
  description: "Comprehensive analytics explore joining base view_08239 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08239
  
  always_filter: {
    filters: [view_08239.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08239.created_at_date: "7 days"]
    unless: [view_08239.id, view_08239.status]
  }

  join: view_08241 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08239.user_id} = ${view_08241.id} ;;
    required_joins: []
  }

  join: view_08242 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08239.account_id} = ${view_08242.account_id} ;;
    required_joins: [view_08241]
  }

  join: view_08243 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08239.category} = ${view_08243.category} ;;
  }

  access_filter: {
    field: view_08239.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08239.is_deleted} = false ;;
}
