# Explore: explore_1605
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04816.view.lkml"
include: "/views/domain_18/view_04818.view.lkml"
include: "/views/domain_19/view_04819.view.lkml"
include: "/views/domain_20/view_04820.view.lkml"

explore: explore_1605 {
  label: "Explore Explore 1605"
  description: "Comprehensive analytics explore joining base view_04816 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04816
  
  always_filter: {
    filters: [view_04816.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04816.created_at_date: "7 days"]
    unless: [view_04816.id, view_04816.status]
  }

  join: view_04818 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04816.user_id} = ${view_04818.id} ;;
    required_joins: []
  }

  join: view_04819 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04816.account_id} = ${view_04819.account_id} ;;
    required_joins: [view_04818]
  }

  join: view_04820 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04816.category} = ${view_04820.category} ;;
  }

  access_filter: {
    field: view_04816.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04816.is_deleted} = false ;;
}
