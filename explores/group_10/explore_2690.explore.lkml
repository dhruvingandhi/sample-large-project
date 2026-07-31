# Update for 2000 file diff target
# Explore: explore_2690
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08071.view.lkml"
include: "/views/domain_23/view_08073.view.lkml"
include: "/views/domain_24/view_08074.view.lkml"
include: "/views/domain_25/view_08075.view.lkml"

explore: explore_2690 {
  label: "Explore Explore 2690"
  description: "Comprehensive analytics explore joining base view_08071 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08071
  
  always_filter: {
    filters: [view_08071.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08071.created_at_date: "7 days"]
    unless: [view_08071.id, view_08071.status]
  }

  join: view_08073 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08071.user_id} = ${view_08073.id} ;;
    required_joins: []
  }

  join: view_08074 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08071.account_id} = ${view_08074.account_id} ;;
    required_joins: [view_08073]
  }

  join: view_08075 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08071.category} = ${view_08075.category} ;;
  }

  access_filter: {
    field: view_08071.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08071.is_deleted} = false ;;
}
