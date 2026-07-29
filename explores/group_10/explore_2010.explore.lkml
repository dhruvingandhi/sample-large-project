# Explore: explore_2010
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06031.view.lkml"
include: "/views/domain_33/view_06033.view.lkml"
include: "/views/domain_34/view_06034.view.lkml"
include: "/views/domain_35/view_06035.view.lkml"

explore: explore_2010 {
  label: "Explore Explore 2010"
  description: "Comprehensive analytics explore joining base view_06031 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06031
  
  always_filter: {
    filters: [view_06031.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06031.created_at_date: "7 days"]
    unless: [view_06031.id, view_06031.status]
  }

  join: view_06033 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06031.user_id} = ${view_06033.id} ;;
    required_joins: []
  }

  join: view_06034 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06031.account_id} = ${view_06034.account_id} ;;
    required_joins: [view_06033]
  }

  join: view_06035 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06031.category} = ${view_06035.category} ;;
  }

  access_filter: {
    field: view_06031.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06031.is_deleted} = false ;;
}
