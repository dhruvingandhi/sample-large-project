# Update for 2000 file diff target
# Explore: explore_0357
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01072.view.lkml"
include: "/views/domain_24/view_01074.view.lkml"
include: "/views/domain_25/view_01075.view.lkml"
include: "/views/domain_26/view_01076.view.lkml"

explore: explore_0357 {
  label: "Explore Explore 0357"
  description: "Comprehensive analytics explore joining base view_01072 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01072
  
  always_filter: {
    filters: [view_01072.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01072.created_at_date: "7 days"]
    unless: [view_01072.id, view_01072.status]
  }

  join: view_01074 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01072.user_id} = ${view_01074.id} ;;
    required_joins: []
  }

  join: view_01075 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01072.account_id} = ${view_01075.account_id} ;;
    required_joins: [view_01074]
  }

  join: view_01076 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01072.category} = ${view_01076.category} ;;
  }

  access_filter: {
    field: view_01072.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01072.is_deleted} = false ;;
}
