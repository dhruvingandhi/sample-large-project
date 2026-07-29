# Explore: explore_1632
# Auto-generated LookML Explore File

include: "/views/domain_47/view_04897.view.lkml"
include: "/views/domain_49/view_04899.view.lkml"
include: "/views/domain_50/view_04900.view.lkml"
include: "/views/domain_01/view_04901.view.lkml"

explore: explore_1632 {
  label: "Explore Explore 1632"
  description: "Comprehensive analytics explore joining base view_04897 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04897
  
  always_filter: {
    filters: [view_04897.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04897.created_at_date: "7 days"]
    unless: [view_04897.id, view_04897.status]
  }

  join: view_04899 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04897.user_id} = ${view_04899.id} ;;
    required_joins: []
  }

  join: view_04900 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04897.account_id} = ${view_04900.account_id} ;;
    required_joins: [view_04899]
  }

  join: view_04901 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04897.category} = ${view_04901.category} ;;
  }

  access_filter: {
    field: view_04897.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04897.is_deleted} = false ;;
}
