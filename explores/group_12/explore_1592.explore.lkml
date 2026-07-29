# Explore: explore_1592
# Auto-generated LookML Explore File

include: "/views/domain_27/view_04777.view.lkml"
include: "/views/domain_29/view_04779.view.lkml"
include: "/views/domain_30/view_04780.view.lkml"
include: "/views/domain_31/view_04781.view.lkml"

explore: explore_1592 {
  label: "Explore Explore 1592"
  description: "Comprehensive analytics explore joining base view_04777 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04777
  
  always_filter: {
    filters: [view_04777.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04777.created_at_date: "7 days"]
    unless: [view_04777.id, view_04777.status]
  }

  join: view_04779 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04777.user_id} = ${view_04779.id} ;;
    required_joins: []
  }

  join: view_04780 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04777.account_id} = ${view_04780.account_id} ;;
    required_joins: [view_04779]
  }

  join: view_04781 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04777.category} = ${view_04781.category} ;;
  }

  access_filter: {
    field: view_04777.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04777.is_deleted} = false ;;
}
