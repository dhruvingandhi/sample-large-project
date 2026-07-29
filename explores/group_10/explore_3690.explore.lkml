# Explore: explore_3690
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11071.view.lkml"
include: "/views/domain_23/view_11073.view.lkml"
include: "/views/domain_24/view_11074.view.lkml"
include: "/views/domain_25/view_11075.view.lkml"

explore: explore_3690 {
  label: "Explore Explore 3690"
  description: "Comprehensive analytics explore joining base view_11071 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11071
  
  always_filter: {
    filters: [view_11071.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11071.created_at_date: "7 days"]
    unless: [view_11071.id, view_11071.status]
  }

  join: view_11073 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11071.user_id} = ${view_11073.id} ;;
    required_joins: []
  }

  join: view_11074 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11071.account_id} = ${view_11074.account_id} ;;
    required_joins: [view_11073]
  }

  join: view_11075 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11071.category} = ${view_11075.category} ;;
  }

  access_filter: {
    field: view_11071.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11071.is_deleted} = false ;;
}
