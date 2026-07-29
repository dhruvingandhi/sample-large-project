# Explore: explore_1080
# Auto-generated LookML Explore File

include: "/views/domain_41/view_03241.view.lkml"
include: "/views/domain_43/view_03243.view.lkml"
include: "/views/domain_44/view_03244.view.lkml"
include: "/views/domain_45/view_03245.view.lkml"

explore: explore_1080 {
  label: "Explore Explore 1080"
  description: "Comprehensive analytics explore joining base view_03241 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03241
  
  always_filter: {
    filters: [view_03241.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03241.created_at_date: "7 days"]
    unless: [view_03241.id, view_03241.status]
  }

  join: view_03243 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03241.user_id} = ${view_03243.id} ;;
    required_joins: []
  }

  join: view_03244 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03241.account_id} = ${view_03244.account_id} ;;
    required_joins: [view_03243]
  }

  join: view_03245 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03241.category} = ${view_03245.category} ;;
  }

  access_filter: {
    field: view_03241.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03241.is_deleted} = false ;;
}
