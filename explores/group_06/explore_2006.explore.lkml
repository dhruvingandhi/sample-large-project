# Explore: explore_2006
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06019.view.lkml"
include: "/views/domain_21/view_06021.view.lkml"
include: "/views/domain_22/view_06022.view.lkml"
include: "/views/domain_23/view_06023.view.lkml"

explore: explore_2006 {
  label: "Explore Explore 2006"
  description: "Comprehensive analytics explore joining base view_06019 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06019
  
  always_filter: {
    filters: [view_06019.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06019.created_at_date: "7 days"]
    unless: [view_06019.id, view_06019.status]
  }

  join: view_06021 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06019.user_id} = ${view_06021.id} ;;
    required_joins: []
  }

  join: view_06022 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06019.account_id} = ${view_06022.account_id} ;;
    required_joins: [view_06021]
  }

  join: view_06023 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06019.category} = ${view_06023.category} ;;
  }

  access_filter: {
    field: view_06019.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06019.is_deleted} = false ;;
}
