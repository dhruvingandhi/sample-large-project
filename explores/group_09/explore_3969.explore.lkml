# Explore: explore_3969
# Auto-generated LookML Explore File

include: "/views/domain_08/view_11908.view.lkml"
include: "/views/domain_10/view_11910.view.lkml"
include: "/views/domain_11/view_11911.view.lkml"
include: "/views/domain_12/view_11912.view.lkml"

explore: explore_3969 {
  label: "Explore Explore 3969"
  description: "Comprehensive analytics explore joining base view_11908 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11908
  
  always_filter: {
    filters: [view_11908.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11908.created_at_date: "7 days"]
    unless: [view_11908.id, view_11908.status]
  }

  join: view_11910 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11908.user_id} = ${view_11910.id} ;;
    required_joins: []
  }

  join: view_11911 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11908.account_id} = ${view_11911.account_id} ;;
    required_joins: [view_11910]
  }

  join: view_11912 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11908.category} = ${view_11912.category} ;;
  }

  access_filter: {
    field: view_11908.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11908.is_deleted} = false ;;
}
