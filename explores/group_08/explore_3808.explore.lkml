# Explore: explore_3808
# Auto-generated LookML Explore File

include: "/views/domain_25/view_11425.view.lkml"
include: "/views/domain_27/view_11427.view.lkml"
include: "/views/domain_28/view_11428.view.lkml"
include: "/views/domain_29/view_11429.view.lkml"

explore: explore_3808 {
  label: "Explore Explore 3808"
  description: "Comprehensive analytics explore joining base view_11425 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11425
  
  always_filter: {
    filters: [view_11425.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11425.created_at_date: "7 days"]
    unless: [view_11425.id, view_11425.status]
  }

  join: view_11427 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11425.user_id} = ${view_11427.id} ;;
    required_joins: []
  }

  join: view_11428 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11425.account_id} = ${view_11428.account_id} ;;
    required_joins: [view_11427]
  }

  join: view_11429 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11425.category} = ${view_11429.category} ;;
  }

  access_filter: {
    field: view_11425.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11425.is_deleted} = false ;;
}
