# Explore: explore_2576
# Auto-generated LookML Explore File

include: "/views/domain_29/view_07729.view.lkml"
include: "/views/domain_31/view_07731.view.lkml"
include: "/views/domain_32/view_07732.view.lkml"
include: "/views/domain_33/view_07733.view.lkml"

explore: explore_2576 {
  label: "Explore Explore 2576"
  description: "Comprehensive analytics explore joining base view_07729 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07729
  
  always_filter: {
    filters: [view_07729.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07729.created_at_date: "7 days"]
    unless: [view_07729.id, view_07729.status]
  }

  join: view_07731 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07729.user_id} = ${view_07731.id} ;;
    required_joins: []
  }

  join: view_07732 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07729.account_id} = ${view_07732.account_id} ;;
    required_joins: [view_07731]
  }

  join: view_07733 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07729.category} = ${view_07733.category} ;;
  }

  access_filter: {
    field: view_07729.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07729.is_deleted} = false ;;
}
