# Explore: explore_2946
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08839.view.lkml"
include: "/views/domain_41/view_08841.view.lkml"
include: "/views/domain_42/view_08842.view.lkml"
include: "/views/domain_43/view_08843.view.lkml"

explore: explore_2946 {
  label: "Explore Explore 2946"
  description: "Comprehensive analytics explore joining base view_08839 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08839
  
  always_filter: {
    filters: [view_08839.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08839.created_at_date: "7 days"]
    unless: [view_08839.id, view_08839.status]
  }

  join: view_08841 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08839.user_id} = ${view_08841.id} ;;
    required_joins: []
  }

  join: view_08842 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08839.account_id} = ${view_08842.account_id} ;;
    required_joins: [view_08841]
  }

  join: view_08843 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08839.category} = ${view_08843.category} ;;
  }

  access_filter: {
    field: view_08839.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08839.is_deleted} = false ;;
}
