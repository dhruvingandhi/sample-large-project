# Explore: explore_1746
# Auto-generated LookML Explore File

include: "/views/domain_39/view_05239.view.lkml"
include: "/views/domain_41/view_05241.view.lkml"
include: "/views/domain_42/view_05242.view.lkml"
include: "/views/domain_43/view_05243.view.lkml"

explore: explore_1746 {
  label: "Explore Explore 1746"
  description: "Comprehensive analytics explore joining base view_05239 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05239
  
  always_filter: {
    filters: [view_05239.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05239.created_at_date: "7 days"]
    unless: [view_05239.id, view_05239.status]
  }

  join: view_05241 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05239.user_id} = ${view_05241.id} ;;
    required_joins: []
  }

  join: view_05242 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05239.account_id} = ${view_05242.account_id} ;;
    required_joins: [view_05241]
  }

  join: view_05243 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05239.category} = ${view_05243.category} ;;
  }

  access_filter: {
    field: view_05239.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05239.is_deleted} = false ;;
}
