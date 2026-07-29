# Explore: explore_1585
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04756.view.lkml"
include: "/views/domain_08/view_04758.view.lkml"
include: "/views/domain_09/view_04759.view.lkml"
include: "/views/domain_10/view_04760.view.lkml"

explore: explore_1585 {
  label: "Explore Explore 1585"
  description: "Comprehensive analytics explore joining base view_04756 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04756
  
  always_filter: {
    filters: [view_04756.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04756.created_at_date: "7 days"]
    unless: [view_04756.id, view_04756.status]
  }

  join: view_04758 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04756.user_id} = ${view_04758.id} ;;
    required_joins: []
  }

  join: view_04759 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04756.account_id} = ${view_04759.account_id} ;;
    required_joins: [view_04758]
  }

  join: view_04760 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04756.category} = ${view_04760.category} ;;
  }

  access_filter: {
    field: view_04756.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04756.is_deleted} = false ;;
}
