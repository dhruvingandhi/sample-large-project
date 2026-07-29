# Explore: explore_2900
# Auto-generated LookML Explore File

include: "/views/domain_01/view_08701.view.lkml"
include: "/views/domain_03/view_08703.view.lkml"
include: "/views/domain_04/view_08704.view.lkml"
include: "/views/domain_05/view_08705.view.lkml"

explore: explore_2900 {
  label: "Explore Explore 2900"
  description: "Comprehensive analytics explore joining base view_08701 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08701
  
  always_filter: {
    filters: [view_08701.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08701.created_at_date: "7 days"]
    unless: [view_08701.id, view_08701.status]
  }

  join: view_08703 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08701.user_id} = ${view_08703.id} ;;
    required_joins: []
  }

  join: view_08704 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08701.account_id} = ${view_08704.account_id} ;;
    required_joins: [view_08703]
  }

  join: view_08705 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08701.category} = ${view_08705.category} ;;
  }

  access_filter: {
    field: view_08701.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08701.is_deleted} = false ;;
}
