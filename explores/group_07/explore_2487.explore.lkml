# Explore: explore_2487
# Auto-generated LookML Explore File

include: "/views/domain_12/view_07462.view.lkml"
include: "/views/domain_14/view_07464.view.lkml"
include: "/views/domain_15/view_07465.view.lkml"
include: "/views/domain_16/view_07466.view.lkml"

explore: explore_2487 {
  label: "Explore Explore 2487"
  description: "Comprehensive analytics explore joining base view_07462 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07462
  
  always_filter: {
    filters: [view_07462.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07462.created_at_date: "7 days"]
    unless: [view_07462.id, view_07462.status]
  }

  join: view_07464 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07462.user_id} = ${view_07464.id} ;;
    required_joins: []
  }

  join: view_07465 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07462.account_id} = ${view_07465.account_id} ;;
    required_joins: [view_07464]
  }

  join: view_07466 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07462.category} = ${view_07466.category} ;;
  }

  access_filter: {
    field: view_07462.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07462.is_deleted} = false ;;
}
