# Explore: explore_1694
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05083.view.lkml"
include: "/views/domain_35/view_05085.view.lkml"
include: "/views/domain_36/view_05086.view.lkml"
include: "/views/domain_37/view_05087.view.lkml"

explore: explore_1694 {
  label: "Explore Explore 1694"
  description: "Comprehensive analytics explore joining base view_05083 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05083
  
  always_filter: {
    filters: [view_05083.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05083.created_at_date: "7 days"]
    unless: [view_05083.id, view_05083.status]
  }

  join: view_05085 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05083.user_id} = ${view_05085.id} ;;
    required_joins: []
  }

  join: view_05086 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05083.account_id} = ${view_05086.account_id} ;;
    required_joins: [view_05085]
  }

  join: view_05087 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05083.category} = ${view_05087.category} ;;
  }

  access_filter: {
    field: view_05083.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05083.is_deleted} = false ;;
}
