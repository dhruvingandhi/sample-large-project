# Explore: explore_0586
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01759.view.lkml"
include: "/views/domain_11/view_01761.view.lkml"
include: "/views/domain_12/view_01762.view.lkml"
include: "/views/domain_13/view_01763.view.lkml"

explore: explore_0586 {
  label: "Explore Explore 0586"
  description: "Comprehensive analytics explore joining base view_01759 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01759
  
  always_filter: {
    filters: [view_01759.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01759.created_at_date: "7 days"]
    unless: [view_01759.id, view_01759.status]
  }

  join: view_01761 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01759.user_id} = ${view_01761.id} ;;
    required_joins: []
  }

  join: view_01762 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01759.account_id} = ${view_01762.account_id} ;;
    required_joins: [view_01761]
  }

  join: view_01763 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01759.category} = ${view_01763.category} ;;
  }

  access_filter: {
    field: view_01759.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01759.is_deleted} = false ;;
}
