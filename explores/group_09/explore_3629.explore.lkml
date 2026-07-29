# Explore: explore_3629
# Auto-generated LookML Explore File

include: "/views/domain_38/view_10888.view.lkml"
include: "/views/domain_40/view_10890.view.lkml"
include: "/views/domain_41/view_10891.view.lkml"
include: "/views/domain_42/view_10892.view.lkml"

explore: explore_3629 {
  label: "Explore Explore 3629"
  description: "Comprehensive analytics explore joining base view_10888 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10888
  
  always_filter: {
    filters: [view_10888.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10888.created_at_date: "7 days"]
    unless: [view_10888.id, view_10888.status]
  }

  join: view_10890 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10888.user_id} = ${view_10890.id} ;;
    required_joins: []
  }

  join: view_10891 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10888.account_id} = ${view_10891.account_id} ;;
    required_joins: [view_10890]
  }

  join: view_10892 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10888.category} = ${view_10892.category} ;;
  }

  access_filter: {
    field: view_10888.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10888.is_deleted} = false ;;
}
