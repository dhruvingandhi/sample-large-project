# Explore: explore_1394
# Auto-generated LookML Explore File

include: "/views/domain_33/view_04183.view.lkml"
include: "/views/domain_35/view_04185.view.lkml"
include: "/views/domain_36/view_04186.view.lkml"
include: "/views/domain_37/view_04187.view.lkml"

explore: explore_1394 {
  label: "Explore Explore 1394"
  description: "Comprehensive analytics explore joining base view_04183 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04183
  
  always_filter: {
    filters: [view_04183.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04183.created_at_date: "7 days"]
    unless: [view_04183.id, view_04183.status]
  }

  join: view_04185 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04183.user_id} = ${view_04185.id} ;;
    required_joins: []
  }

  join: view_04186 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04183.account_id} = ${view_04186.account_id} ;;
    required_joins: [view_04185]
  }

  join: view_04187 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04183.category} = ${view_04187.category} ;;
  }

  access_filter: {
    field: view_04183.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04183.is_deleted} = false ;;
}
