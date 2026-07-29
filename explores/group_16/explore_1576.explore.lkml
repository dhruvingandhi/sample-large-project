# Explore: explore_1576
# Auto-generated LookML Explore File

include: "/views/domain_29/view_04729.view.lkml"
include: "/views/domain_31/view_04731.view.lkml"
include: "/views/domain_32/view_04732.view.lkml"
include: "/views/domain_33/view_04733.view.lkml"

explore: explore_1576 {
  label: "Explore Explore 1576"
  description: "Comprehensive analytics explore joining base view_04729 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04729
  
  always_filter: {
    filters: [view_04729.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04729.created_at_date: "7 days"]
    unless: [view_04729.id, view_04729.status]
  }

  join: view_04731 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04729.user_id} = ${view_04731.id} ;;
    required_joins: []
  }

  join: view_04732 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04729.account_id} = ${view_04732.account_id} ;;
    required_joins: [view_04731]
  }

  join: view_04733 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04729.category} = ${view_04733.category} ;;
  }

  access_filter: {
    field: view_04729.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04729.is_deleted} = false ;;
}
