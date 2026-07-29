# Explore: explore_2911
# Auto-generated LookML Explore File

include: "/views/domain_34/view_08734.view.lkml"
include: "/views/domain_36/view_08736.view.lkml"
include: "/views/domain_37/view_08737.view.lkml"
include: "/views/domain_38/view_08738.view.lkml"

explore: explore_2911 {
  label: "Explore Explore 2911"
  description: "Comprehensive analytics explore joining base view_08734 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08734
  
  always_filter: {
    filters: [view_08734.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08734.created_at_date: "7 days"]
    unless: [view_08734.id, view_08734.status]
  }

  join: view_08736 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08734.user_id} = ${view_08736.id} ;;
    required_joins: []
  }

  join: view_08737 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08734.account_id} = ${view_08737.account_id} ;;
    required_joins: [view_08736]
  }

  join: view_08738 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08734.category} = ${view_08738.category} ;;
  }

  access_filter: {
    field: view_08734.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08734.is_deleted} = false ;;
}
