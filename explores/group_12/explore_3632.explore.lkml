# Explore: explore_3632
# Auto-generated LookML Explore File

include: "/views/domain_47/view_10897.view.lkml"
include: "/views/domain_49/view_10899.view.lkml"
include: "/views/domain_50/view_10900.view.lkml"
include: "/views/domain_01/view_10901.view.lkml"

explore: explore_3632 {
  label: "Explore Explore 3632"
  description: "Comprehensive analytics explore joining base view_10897 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10897
  
  always_filter: {
    filters: [view_10897.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10897.created_at_date: "7 days"]
    unless: [view_10897.id, view_10897.status]
  }

  join: view_10899 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10897.user_id} = ${view_10899.id} ;;
    required_joins: []
  }

  join: view_10900 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10897.account_id} = ${view_10900.account_id} ;;
    required_joins: [view_10899]
  }

  join: view_10901 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10897.category} = ${view_10901.category} ;;
  }

  access_filter: {
    field: view_10897.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10897.is_deleted} = false ;;
}
