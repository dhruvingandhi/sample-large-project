# Explore: explore_2814
# Auto-generated LookML Explore File

include: "/views/domain_43/view_08443.view.lkml"
include: "/views/domain_45/view_08445.view.lkml"
include: "/views/domain_46/view_08446.view.lkml"
include: "/views/domain_47/view_08447.view.lkml"

explore: explore_2814 {
  label: "Explore Explore 2814"
  description: "Comprehensive analytics explore joining base view_08443 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08443
  
  always_filter: {
    filters: [view_08443.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08443.created_at_date: "7 days"]
    unless: [view_08443.id, view_08443.status]
  }

  join: view_08445 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08443.user_id} = ${view_08445.id} ;;
    required_joins: []
  }

  join: view_08446 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08443.account_id} = ${view_08446.account_id} ;;
    required_joins: [view_08445]
  }

  join: view_08447 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08443.category} = ${view_08447.category} ;;
  }

  access_filter: {
    field: view_08443.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08443.is_deleted} = false ;;
}
