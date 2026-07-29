# Explore: explore_3437
# Auto-generated LookML Explore File

include: "/views/domain_12/view_10312.view.lkml"
include: "/views/domain_14/view_10314.view.lkml"
include: "/views/domain_15/view_10315.view.lkml"
include: "/views/domain_16/view_10316.view.lkml"

explore: explore_3437 {
  label: "Explore Explore 3437"
  description: "Comprehensive analytics explore joining base view_10312 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10312
  
  always_filter: {
    filters: [view_10312.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10312.created_at_date: "7 days"]
    unless: [view_10312.id, view_10312.status]
  }

  join: view_10314 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10312.user_id} = ${view_10314.id} ;;
    required_joins: []
  }

  join: view_10315 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10312.account_id} = ${view_10315.account_id} ;;
    required_joins: [view_10314]
  }

  join: view_10316 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10312.category} = ${view_10316.category} ;;
  }

  access_filter: {
    field: view_10312.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10312.is_deleted} = false ;;
}
