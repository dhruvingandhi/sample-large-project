# Explore: explore_2694
# Auto-generated LookML Explore File

include: "/views/domain_33/view_08083.view.lkml"
include: "/views/domain_35/view_08085.view.lkml"
include: "/views/domain_36/view_08086.view.lkml"
include: "/views/domain_37/view_08087.view.lkml"

explore: explore_2694 {
  label: "Explore Explore 2694"
  description: "Comprehensive analytics explore joining base view_08083 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08083
  
  always_filter: {
    filters: [view_08083.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08083.created_at_date: "7 days"]
    unless: [view_08083.id, view_08083.status]
  }

  join: view_08085 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08083.user_id} = ${view_08085.id} ;;
    required_joins: []
  }

  join: view_08086 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08083.account_id} = ${view_08086.account_id} ;;
    required_joins: [view_08085]
  }

  join: view_08087 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08083.category} = ${view_08087.category} ;;
  }

  access_filter: {
    field: view_08083.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08083.is_deleted} = false ;;
}
