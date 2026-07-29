# Explore: explore_2011
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06034.view.lkml"
include: "/views/domain_36/view_06036.view.lkml"
include: "/views/domain_37/view_06037.view.lkml"
include: "/views/domain_38/view_06038.view.lkml"

explore: explore_2011 {
  label: "Explore Explore 2011"
  description: "Comprehensive analytics explore joining base view_06034 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06034
  
  always_filter: {
    filters: [view_06034.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06034.created_at_date: "7 days"]
    unless: [view_06034.id, view_06034.status]
  }

  join: view_06036 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06034.user_id} = ${view_06036.id} ;;
    required_joins: []
  }

  join: view_06037 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06034.account_id} = ${view_06037.account_id} ;;
    required_joins: [view_06036]
  }

  join: view_06038 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06034.category} = ${view_06038.category} ;;
  }

  access_filter: {
    field: view_06034.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06034.is_deleted} = false ;;
}
