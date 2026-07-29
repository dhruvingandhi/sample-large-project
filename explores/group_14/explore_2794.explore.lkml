# Explore: explore_2794
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08383.view.lkml"
include: "/views/domain_35/view_08385.view.lkml"
include: "/views/domain_36/view_08386.view.lkml"
include: "/views/domain_37/view_08387.view.lkml"

explore: explore_2794 {
  label: "Explore Explore 2794"
  description: "Comprehensive analytics explore joining base view_08383 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08383
  
  always_filter: {
    filters: [view_08383.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08383.created_at_date: "7 days"]
    unless: [view_08383.id, view_08383.status]
  }

  join: view_08385 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08383.user_id} = ${view_08385.id} ;;
    required_joins: []
  }

  join: view_08386 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08383.account_id} = ${view_08386.account_id} ;;
    required_joins: [view_08385]
  }

  join: view_08387 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08383.category} = ${view_08387.category} ;;
  }

  access_filter: {
    field: view_08383.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08383.is_deleted} = false ;;
}
