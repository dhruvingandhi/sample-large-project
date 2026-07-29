# Explore: explore_2410
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07231.view.lkml"
include: "/views/domain_33/view_07233.view.lkml"
include: "/views/domain_34/view_07234.view.lkml"
include: "/views/domain_35/view_07235.view.lkml"

explore: explore_2410 {
  label: "Explore Explore 2410"
  description: "Comprehensive analytics explore joining base view_07231 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07231
  
  always_filter: {
    filters: [view_07231.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07231.created_at_date: "7 days"]
    unless: [view_07231.id, view_07231.status]
  }

  join: view_07233 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07231.user_id} = ${view_07233.id} ;;
    required_joins: []
  }

  join: view_07234 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07231.account_id} = ${view_07234.account_id} ;;
    required_joins: [view_07233]
  }

  join: view_07235 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07231.category} = ${view_07235.category} ;;
  }

  access_filter: {
    field: view_07231.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07231.is_deleted} = false ;;
}
