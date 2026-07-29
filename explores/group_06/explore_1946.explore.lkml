# Explore: explore_1946
# Auto-generated LookML Explore File

include: "/views/domain_39/view_05839.view.lkml"
include: "/views/domain_41/view_05841.view.lkml"
include: "/views/domain_42/view_05842.view.lkml"
include: "/views/domain_43/view_05843.view.lkml"

explore: explore_1946 {
  label: "Explore Explore 1946"
  description: "Comprehensive analytics explore joining base view_05839 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05839
  
  always_filter: {
    filters: [view_05839.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05839.created_at_date: "7 days"]
    unless: [view_05839.id, view_05839.status]
  }

  join: view_05841 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05839.user_id} = ${view_05841.id} ;;
    required_joins: []
  }

  join: view_05842 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05839.account_id} = ${view_05842.account_id} ;;
    required_joins: [view_05841]
  }

  join: view_05843 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05839.category} = ${view_05843.category} ;;
  }

  access_filter: {
    field: view_05839.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05839.is_deleted} = false ;;
}
