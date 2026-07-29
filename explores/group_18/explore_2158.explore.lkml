# Explore: explore_2158
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06475.view.lkml"
include: "/views/domain_27/view_06477.view.lkml"
include: "/views/domain_28/view_06478.view.lkml"
include: "/views/domain_29/view_06479.view.lkml"

explore: explore_2158 {
  label: "Explore Explore 2158"
  description: "Comprehensive analytics explore joining base view_06475 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06475
  
  always_filter: {
    filters: [view_06475.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06475.created_at_date: "7 days"]
    unless: [view_06475.id, view_06475.status]
  }

  join: view_06477 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06475.user_id} = ${view_06477.id} ;;
    required_joins: []
  }

  join: view_06478 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06475.account_id} = ${view_06478.account_id} ;;
    required_joins: [view_06477]
  }

  join: view_06479 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06475.category} = ${view_06479.category} ;;
  }

  access_filter: {
    field: view_06475.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06475.is_deleted} = false ;;
}
