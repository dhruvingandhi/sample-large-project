# Explore: explore_1344
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04033.view.lkml"
include: "/views/domain_35/view_04035.view.lkml"
include: "/views/domain_36/view_04036.view.lkml"
include: "/views/domain_37/view_04037.view.lkml"

explore: explore_1344 {
  label: "Explore Explore 1344"
  description: "Comprehensive analytics explore joining base view_04033 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04033
  
  always_filter: {
    filters: [view_04033.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04033.created_at_date: "7 days"]
    unless: [view_04033.id, view_04033.status]
  }

  join: view_04035 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04033.user_id} = ${view_04035.id} ;;
    required_joins: []
  }

  join: view_04036 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04033.account_id} = ${view_04036.account_id} ;;
    required_joins: [view_04035]
  }

  join: view_04037 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04033.category} = ${view_04037.category} ;;
  }

  access_filter: {
    field: view_04033.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04033.is_deleted} = false ;;
}
