# Explore: explore_0844
# Auto-generated LookML Explore File

include: "/views/domain_33/view_02533.view.lkml"
include: "/views/domain_35/view_02535.view.lkml"
include: "/views/domain_36/view_02536.view.lkml"
include: "/views/domain_37/view_02537.view.lkml"

explore: explore_0844 {
  label: "Explore Explore 0844"
  description: "Comprehensive analytics explore joining base view_02533 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02533
  
  always_filter: {
    filters: [view_02533.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02533.created_at_date: "7 days"]
    unless: [view_02533.id, view_02533.status]
  }

  join: view_02535 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02533.user_id} = ${view_02535.id} ;;
    required_joins: []
  }

  join: view_02536 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02533.account_id} = ${view_02536.account_id} ;;
    required_joins: [view_02535]
  }

  join: view_02537 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02533.category} = ${view_02537.category} ;;
  }

  access_filter: {
    field: view_02533.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02533.is_deleted} = false ;;
}
