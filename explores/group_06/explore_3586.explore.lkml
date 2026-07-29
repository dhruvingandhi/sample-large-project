# Explore: explore_3586
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10759.view.lkml"
include: "/views/domain_11/view_10761.view.lkml"
include: "/views/domain_12/view_10762.view.lkml"
include: "/views/domain_13/view_10763.view.lkml"

explore: explore_3586 {
  label: "Explore Explore 3586"
  description: "Comprehensive analytics explore joining base view_10759 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_10759
  
  always_filter: {
    filters: [view_10759.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10759.created_at_date: "7 days"]
    unless: [view_10759.id, view_10759.status]
  }

  join: view_10761 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10759.user_id} = ${view_10761.id} ;;
    required_joins: []
  }

  join: view_10762 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10759.account_id} = ${view_10762.account_id} ;;
    required_joins: [view_10761]
  }

  join: view_10763 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10759.category} = ${view_10763.category} ;;
  }

  access_filter: {
    field: view_10759.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10759.is_deleted} = false ;;
}
