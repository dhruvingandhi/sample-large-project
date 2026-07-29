# Explore: explore_0292
# Auto-generated LookML Explore File

include: "/views/domain_27/view_00877.view.lkml"
include: "/views/domain_29/view_00879.view.lkml"
include: "/views/domain_30/view_00880.view.lkml"
include: "/views/domain_31/view_00881.view.lkml"

explore: explore_0292 {
  label: "Explore Explore 0292"
  description: "Comprehensive analytics explore joining base view_00877 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00877
  
  always_filter: {
    filters: [view_00877.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00877.created_at_date: "7 days"]
    unless: [view_00877.id, view_00877.status]
  }

  join: view_00879 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00877.user_id} = ${view_00879.id} ;;
    required_joins: []
  }

  join: view_00880 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00877.account_id} = ${view_00880.account_id} ;;
    required_joins: [view_00879]
  }

  join: view_00881 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00877.category} = ${view_00881.category} ;;
  }

  access_filter: {
    field: view_00877.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00877.is_deleted} = false ;;
}
