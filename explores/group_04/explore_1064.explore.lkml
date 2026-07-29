# Explore: explore_1064
# Auto-generated LookML Explore File

include: "/views/domain_43/view_03193.view.lkml"
include: "/views/domain_45/view_03195.view.lkml"
include: "/views/domain_46/view_03196.view.lkml"
include: "/views/domain_47/view_03197.view.lkml"

explore: explore_1064 {
  label: "Explore Explore 1064"
  description: "Comprehensive analytics explore joining base view_03193 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03193
  
  always_filter: {
    filters: [view_03193.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03193.created_at_date: "7 days"]
    unless: [view_03193.id, view_03193.status]
  }

  join: view_03195 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03193.user_id} = ${view_03195.id} ;;
    required_joins: []
  }

  join: view_03196 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03193.account_id} = ${view_03196.account_id} ;;
    required_joins: [view_03195]
  }

  join: view_03197 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03193.category} = ${view_03197.category} ;;
  }

  access_filter: {
    field: view_03193.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03193.is_deleted} = false ;;
}
