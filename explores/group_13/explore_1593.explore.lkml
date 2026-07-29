# Explore: explore_1593
# Auto-generated LookML Explore File

include: "/views/domain_30/view_04780.view.lkml"
include: "/views/domain_32/view_04782.view.lkml"
include: "/views/domain_33/view_04783.view.lkml"
include: "/views/domain_34/view_04784.view.lkml"

explore: explore_1593 {
  label: "Explore Explore 1593"
  description: "Comprehensive analytics explore joining base view_04780 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04780
  
  always_filter: {
    filters: [view_04780.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04780.created_at_date: "7 days"]
    unless: [view_04780.id, view_04780.status]
  }

  join: view_04782 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04780.user_id} = ${view_04782.id} ;;
    required_joins: []
  }

  join: view_04783 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04780.account_id} = ${view_04783.account_id} ;;
    required_joins: [view_04782]
  }

  join: view_04784 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04780.category} = ${view_04784.category} ;;
  }

  access_filter: {
    field: view_04780.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04780.is_deleted} = false ;;
}
