# Explore: explore_3589
# Auto-generated LookML Explore File

include: "/views/domain_18/view_10768.view.lkml"
include: "/views/domain_20/view_10770.view.lkml"
include: "/views/domain_21/view_10771.view.lkml"
include: "/views/domain_22/view_10772.view.lkml"

explore: explore_3589 {
  label: "Explore Explore 3589"
  description: "Comprehensive analytics explore joining base view_10768 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10768
  
  always_filter: {
    filters: [view_10768.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10768.created_at_date: "7 days"]
    unless: [view_10768.id, view_10768.status]
  }

  join: view_10770 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10768.user_id} = ${view_10770.id} ;;
    required_joins: []
  }

  join: view_10771 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10768.account_id} = ${view_10771.account_id} ;;
    required_joins: [view_10770]
  }

  join: view_10772 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10768.category} = ${view_10772.category} ;;
  }

  access_filter: {
    field: view_10768.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10768.is_deleted} = false ;;
}
